# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/5WOW/sequence/5WOW.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/5WOW/seeds/seed_1/5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 5.834 A
- tm_score_ca_ordered: 0.17862385430301944
- heavy_atom_rmsd: 6.702 A
- sidechain_heavy_atom_rmsd: 7.591 A
- **all-atom quality (honest):** heavy 6.702 A, sidechain 7.591 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 119
- bin_accuracy: 0.319

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.833764871493672
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 5.8337151860116645  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C16-G24 → 11 conflicts (79%); P31 → 3 conflicts (21%)
- explained: 14/14 conflicts by 2 root cause(s)
- metrics: hubs=10 (frac 0.27), conflicts/hub=1.4, max_incompat=6.0Å, chain_span=0.811
- **fix-first:** [LOW_CONFLICT] Root cause(s): C16-G24 + P31 — explain ~14/14 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C16** — severity 7.71, 3 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): D36@20.3Å(now 14.6,conf 0.59), V34@16.7Å(now 10.4,conf 0.55), D33@16.6Å(now 13.1,conf 0.55)
  - C20↔V34: targets 5.2/16.7Å but partners are 5.5Å apart → too_close_together by 6.0Å
  - D36↔C20: targets 20.3/5.2Å but partners are 10.2Å apart → too_close_together by 4.9Å
  - I21↔V34: targets 5.8/16.7Å but partners are 7.8Å apart → too_close_together by 3.0Å
- **G18** — severity 4.30, 2 conflict(s); suspect input ~`C22` (group: push_out)
  - push-out (wants farther): G24@18.0Å(now 10.7,conf 0.55), Y30@12.5Å(now 4.8,conf 0.55), V2@10.3Å(now 7.7,conf 0.55)
  - G24↔C22: targets 18.0/11.4Å but partners are 1.3Å apart → too_close_together by 5.3Å
  - G24↔C28: targets 18.0/10.3Å but partners are 5.1Å apart → too_close_together by 2.5Å
- **I6** — severity 2.83, 2 conflict(s); suspect input ~`D36` (group: pull_in)
  - pull-in (wants closer): P31@5.9Å(now 9.1,conf 0.55)
  - push-out (wants farther): D13@15.3Å(now 11.9,conf 0.55), G1@13.3Å(now 3.8,conf 0.55)
  - P31↔D36: targets 5.9/15.8Å but partners are 6.7Å apart → too_close_together by 3.2Å
  - P31↔G1: targets 5.9/13.3Å but partners are 5.4Å apart → too_close_together by 2.0Å
- **N25** — severity 1.94, 1 conflict(s); suspect input ~`C28` (group: push_out)
  - push-out (wants farther): P17@17.1Å(now 9.9,conf 0.55)
  - P17↔C28: targets 17.1/8.2Å but partners are 5.4Å apart → too_close_together by 3.6Å
- **R12** — severity 1.80, 1 conflict(s); suspect input ~`K5` (group: push_out)
  - push-out (wants farther): K5@16.5Å(now 11.5,conf 0.55), Q8@11.4Å(now 7.5,conf 0.55)
  - C22↔K5: targets 5.8/16.5Å but partners are 7.3Å apart → too_close_together by 3.3Å
- **P31** — severity 1.78, 1 conflict(s); suspect input ~`S14` (group: push_out)
  - pull-in (wants closer): I6@5.9Å(now 9.1,conf 0.55)
  - push-out (wants farther): S14@16.2Å(now 11.6,conf 0.55)
  - C3↔S14: targets 4.6/16.2Å but partners are 8.4Å apart → too_close_together by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=9 · 3-10(G)=3 · coil(C)=2

```
CHHHHHHEEHHEHHHEEHHGEHEHHGHHEHGHHHHCE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=10 · sheet=23
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - I6 ↔ C10  (helix)
  - L7 ↔ R11  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - G24 ↔ C28  (helix)
  - C28 ↔ Y32  (helix)
  - Y30 ↔ V34  (helix)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ P17  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ R23  (sheet)
  - R9 ↔ C16  (sheet)
  - R9 ↔ P17  (sheet)
  - R9 ↔ I21  (sheet)
  - R9 ↔ R23  (sheet)
  - R9 ↔ G29  (sheet)
  - R12 ↔ P17  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=259 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=164 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.5312 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
