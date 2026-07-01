# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/5WOW/sequence/5WOW.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/5WOW/seeds/seed_0/5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 4.861 A
- tm_score_ca_ordered: 0.18886056734692405
- heavy_atom_rmsd: 6.651 A
- sidechain_heavy_atom_rmsd: 8.314 A
- **all-atom quality (honest):** heavy 6.651 A, sidechain 8.314 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 119
- bin_accuracy: 0.261

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.860837274247381
- ga_delta_rmsd: 1.1142163707157398  ga_fitness_mode: energy
- pre_local_rmsd: 4.860737363839476  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G26-C28 → 12 conflicts (50%); R9-R12 → 6 conflicts (25%); P31-D33 → 4 conflicts (17%)
- explained: 22/24 conflicts by 3 root cause(s)
- metrics: hubs=17 (frac 0.459), conflicts/hub=1.4, max_incompat=7.06Å, chain_span=0.919
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G26-C28 + R9-R12 + P31-D33 — explain ~22/24 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R9** — severity 7.81, 3 conflict(s); suspect input ~`Y37` (group: pull_in)
  - pull-in (wants closer): Y27@4.2Å(now 8.5,conf 0.64)
  - push-out (wants farther): Y37@17.0Å(now 14.5,conf 0.55), C16@7.9Å(now 4.0,conf 0.55)
  - Y27↔Y37: targets 4.2/17.0Å but partners are 6.9Å apart → too_close_together by 5.9Å
  - Y27↔P35: targets 4.2/18.7Å but partners are 9.4Å apart → too_close_together by 5.1Å
  - Y27↔D36: targets 4.2/19.1Å but partners are 11.8Å apart → too_close_together by 3.2Å
- **R11** — severity 4.75, 2 conflict(s); suspect input ~`A19` (group: pull_in)
  - pull-in (wants closer): C22@7.2Å(now 10.0,conf 0.55)
  - push-out (wants farther): A19@15.2Å(now 10.2,conf 0.55), G18@14.8Å(now 10.4,conf 0.55), P17@12.0Å(now 8.6,conf 0.55)
  - C22↔A19: targets 7.2/15.2Å but partners are 2.1Å apart → too_close_together by 5.8Å
  - Y37↔C22: targets 20.8/7.2Å but partners are 10.7Å apart → too_close_together by 2.9Å
- **C20** — severity 3.98, 2 conflict(s); suspect input ~`G26` (group: push_out)
  - pull-in (wants closer): C16@5.2Å(now 8.8,conf 0.57)
  - push-out (wants farther): G26@12.5Å(now 7.6,conf 0.55)
  - C28↔G26: targets 5.9/12.5Å but partners are 1.7Å apart → too_close_together by 4.9Å
  - C16↔R11: targets 5.2/12.0Å but partners are 4.4Å apart → too_close_together by 2.4Å
- **G26** — severity 3.85, 1 conflict(s); suspect input ~`A19` (group: push_out)
  - push-out (wants farther): C22@7.0Å(now 4.3,conf 0.55), C20@12.5Å(now 7.6,conf 0.55), A19@16.2Å(now 6.4,conf 0.55), Y37@16.0Å(now 11.1,conf 0.55)
  - C22↔A19: targets 7.0/16.2Å but partners are 2.1Å apart → too_close_together by 7.1Å
- **I6** — severity 3.64, 2 conflict(s); suspect input ~`G1` (group: pull_in)
  - pull-in (wants closer): D33@8.3Å(now 13.8,conf 0.55)
  - push-out (wants farther): D13@15.3Å(now 12.4,conf 0.55), G1@13.3Å(now 3.4,conf 0.55), G18@11.7Å(now 8.5,conf 0.55)
  - P31↔G1: targets 5.9/13.3Å but partners are 3.9Å apart → too_close_together by 3.5Å
  - D33↔D36: targets 8.3/15.8Å but partners are 4.3Å apart → too_close_together by 3.2Å
- **P31** — severity 2.73, 2 conflict(s); suspect input ~`S14` (group: pull_in)
  - pull-in (wants closer): C3@4.6Å(now 8.0,conf 0.60)
  - push-out (wants farther): R12@16.5Å(now 12.2,conf 0.55), S14@16.2Å(now 11.8,conf 0.55)
  - C3↔S14: targets 4.6/16.2Å but partners are 9.0Å apart → too_close_together by 2.7Å
  - C3↔R12: targets 4.6/16.5Å but partners are 9.6Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=5 · 3-10(G)=5 · coil(C)=0

```
EHHHHHHGEHHHHHHHEHHHHEGHGHHHGHHHHHGHE
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=15 · sheet=6
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - I6 ↔ C10  (helix)
  - L7 ↔ R11  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - R12 ↔ C16  (helix)
  - S14 ↔ G18  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - C20 ↔ G24  (helix)
  - G24 ↔ C28  (helix)
  - Y27 ↔ P31  (helix)
  - C28 ↔ Y32  (helix)
  - Y32 ↔ D36  (helix)
  - G1 ↔ R9  (sheet)
  - G1 ↔ P17  (sheet)
  - R9 ↔ P17  (sheet)
  - R9 ↔ C22  (sheet)
  - P17 ↔ C22  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=240 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=136 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.7345 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
