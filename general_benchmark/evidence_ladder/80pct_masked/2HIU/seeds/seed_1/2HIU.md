# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2HIU/sequence/2HIU.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2HIU/seeds/seed_1/2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 4.160 A
- tm_score_ca_ordered: 0.35961863250838044
- heavy_atom_rmsd: 5.777 A
- sidechain_heavy_atom_rmsd: 6.833 A
- **all-atom quality (honest):** heavy 5.777 A, sidechain 6.833 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 198
- bin_accuracy: 0.470

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.159682335065693
- ga_delta_rmsd: 0.3732732904267557  ga_fitness_mode: energy
- pre_local_rmsd: 4.191917523166123  localized_anchor_rmsd: 4.159665084215677

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K47 → 8 conflicts (53%); S11 → 5 conflicts (33%)
- explained: 13/15 conflicts by 2 root cause(s)
- metrics: hubs=10 (frac 0.213), conflicts/hub=1.5, max_incompat=6.53Å, chain_span=0.936
- **fix-first:** [LOW_CONFLICT] Root cause(s): K47 + S11 — explain ~13/15 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C37** — severity 4.95, 2 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): K47@20.4Å(now 10.7,conf 0.59)
  - K47↔Y34: targets 20.4/4.8Å but partners are 9.2Å apart → too_close_together by 6.5Å
  - K47↔T45: targets 20.4/15.2Å but partners are 3.2Å apart → too_close_together by 2.1Å
- **Y18** — severity 4.29, 2 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): K47@14.2Å(now 9.3,conf 0.55)
  - Y44↔K47: targets 6.0/14.2Å but partners are 3.0Å apart → too_close_together by 5.2Å
  - F43↔K47: targets 6.0/14.2Å but partners are 5.6Å apart → too_close_together by 2.6Å
- **E31** — severity 4.10, 2 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): K47@18.6Å(now 11.2,conf 0.55)
  - Y34↔K47: targets 5.3/18.6Å but partners are 9.2Å apart → too_close_together by 4.1Å
  - K47↔Y44: targets 18.6/12.3Å but partners are 3.0Å apart → too_close_together by 3.3Å
- **Q14** — severity 2.97, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): S11@5.1Å(now 2.4,conf 0.57), N21@11.0Å(now 6.1,conf 0.55), Q22@12.1Å(now 4.8,conf 0.55)
  - S11↔Q22: targets 5.1/12.1Å but partners are 3.6Å apart → too_close_together by 3.4Å
  - S11↔N21: targets 5.1/11.0Å but partners are 3.8Å apart → too_close_together by 2.1Å
- **R40** — severity 2.57, 1 conflict(s); suspect input ~`L35` (group: push_out)
  - push-out (wants farther): K47@22.4Å(now 10.8,conf 0.67), L35@10.0Å(now 4.5,conf 0.55)
  - K47↔L35: targets 22.4/10.0Å but partners are 7.7Å apart → too_close_together by 4.7Å
- **N21** — severity 2.45, 2 conflict(s); suspect input ~`Q14` (group: push_out)
  - push-out (wants farther): Q14@11.0Å(now 6.1,conf 0.55), Y13@11.2Å(now 4.1,conf 0.55)
  - S11↔Q14: targets 6.1/11.0Å but partners are 2.4Å apart → too_close_together by 2.5Å
  - S11↔Y13: targets 6.1/11.2Å but partners are 3.0Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=11 · 3-10(G)=5 · coil(C)=3

```
CHEHHHHEGHHHHHHEHHGEEECGHEHHEHHHHHEHCGHGHHHEHHE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=9 · sheet=14
  - V2 ↔ C6  (helix)
  - T7 ↔ S11  (helix)
  - S11 ↔ L15  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - S27 ↔ E31  (helix)
  - V30 ↔ Y34  (helix)
  - E39 ↔ F43  (helix)
  - G41 ↔ T45  (helix)
  - E3 ↔ S8  (sheet)
  - E3 ↔ Q22  (sheet)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ G26  (sheet)
  - E16 ↔ N21  (sheet)
  - E16 ↔ Q22  (sheet)
  - E16 ↔ L29  (sheet)
  - E16 ↔ L35  (sheet)
  - Q22 ↔ L29  (sheet)
  - L29 ↔ L35  (sheet)
  - L29 ↔ Y44  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=237 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=122 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7525 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
