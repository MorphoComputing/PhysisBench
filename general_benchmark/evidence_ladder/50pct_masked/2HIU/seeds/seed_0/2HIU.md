# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 1.591 A
- tm_score_ca_ordered: 0.7819957268578551
- heavy_atom_rmsd: 3.062 A
- sidechain_heavy_atom_rmsd: 3.586 A
- **all-atom quality (honest):** heavy 3.062 A, sidechain 3.586 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 495
- bin_accuracy: 0.687

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.59052134997901
- ga_delta_rmsd: 2.145445832208232  ga_fitness_mode: energy
- pre_local_rmsd: 1.6591720233593028  localized_anchor_rmsd: 1.5905593908048226

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C19-Q22 → 12 conflicts (100%)
- explained: 12/12 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.106), conflicts/hub=2.4, max_incompat=3.41Å, chain_span=0.638
- **fix-first:** [LOW_CONFLICT] Root cause(s): C19-Q22 — explain ~12/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y44** — severity 4.20, 3 conflict(s); suspect input ~`L15` (group: push_out)
  - push-out (wants farther): V20@20.3Å(now 17.4,conf 0.59)
  - V20↔L15: targets 20.3/9.3Å but partners are 7.5Å apart → too_close_together by 3.4Å
  - V20↔E16: targets 20.3/10.7Å but partners are 7.3Å apart → too_close_together by 2.4Å
  - V20↔Y18: targets 20.3/6.0Å but partners are 12.4Å apart → too_close_together by 1.9Å
- **F42** — severity 3.21, 3 conflict(s); suspect input ~`L12` (group: pull_in)
  - pull-in (wants closer): C19@4.5Å(now 8.5,conf 0.60)
  - C19↔L12: targets 4.5/13.4Å but partners are 6.3Å apart → too_close_together by 2.5Å
  - C19↔N21: targets 4.5/20.5Å but partners are 14.4Å apart → too_close_together by 1.6Å
  - C19↔Y13: targets 4.5/13.8Å but partners are 7.6Å apart → too_close_together by 1.7Å
- **Q14** — severity 2.65, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): N21@11.0Å(now 7.5,conf 0.55), Q22@12.1Å(now 8.2,conf 0.55)
  - S11↔Q22: targets 5.1/12.1Å but partners are 3.9Å apart → too_close_together by 3.1Å
  - S11↔N21: targets 5.1/11.0Å but partners are 4.1Å apart → too_close_together by 1.8Å
- **C37** — severity 2.14, 2 conflict(s); suspect input ~`V20` (group: push_out)
  - push-out (wants farther): V20@16.0Å(now 12.2,conf 0.55)
  - L12↔V20: targets 8.8/16.0Å but partners are 4.9Å apart → too_close_together by 2.4Å
  - E16↔V20: targets 7.2/16.0Å but partners are 7.3Å apart → too_close_together by 1.6Å
- **L15** — severity 2.10, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): Q22@12.2Å(now 8.8,conf 0.55)
  - S11↔Q22: targets 6.0/12.2Å but partners are 3.9Å apart → too_close_together by 2.2Å
  - C10↔Q22: targets 6.8/12.2Å but partners are 3.8Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=10 · 3-10(G)=5 · coil(C)=7

```
CGHEEHHECGEHHHHHHHHECECHGHHHHHHGHEHHHGHHECCECHE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=12 · sheet=11
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - L24 ↔ H28  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Q22  (sheet)
  - C5 ↔ S11  (sheet)
  - C5 ↔ V20  (sheet)
  - C5 ↔ Q22  (sheet)
  - S8 ↔ Q22  (sheet)
  - S11 ↔ V20  (sheet)
  - S11 ↔ Q22  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=175 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=69 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9132 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
