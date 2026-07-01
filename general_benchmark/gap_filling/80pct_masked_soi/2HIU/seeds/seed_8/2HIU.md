# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_8\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 2.815 A
- tm_score_ca_ordered: 0.560038727194958
- heavy_atom_rmsd: 4.231 A
- sidechain_heavy_atom_rmsd: 5.014 A
- **all-atom quality (honest):** heavy 4.231 A, sidechain 5.014 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 367
- bin_accuracy: 0.700

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.8148264942949703
- ga_delta_rmsd: 0.7839868529500404  ga_fitness_mode: energy
- pre_local_rmsd: 2.8149386031096792  localized_anchor_rmsd: 2.8149386031096792

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S11-N17 → 3 conflicts (75%)
- explained: 3/4 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.085), conflicts/hub=1.0, max_incompat=2.07Å, chain_span=0.681
- **fix-first:** [LOW_CONFLICT] Root cause(s): S11-N17 — explain ~3/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 1.26, 1 conflict(s); suspect input ~`S11` (group: push_out)
  - push-out (wants farther): H23@14.7Å(now 12.0,conf 0.84), Q22@14.6Å(now 11.8,conf 0.82), C19@6.1Å(now 3.2,conf 0.67), V20@9.4Å(now 6.6,conf 0.49)
  - Q22↔S11: targets 14.6/8.0Å but partners are 4.8Å apart → too_close_together by 1.8Å
- **P46** — severity 1.13, 1 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): Y13@17.4Å(now 13.9,conf 0.55)
  - Y13↔N17: targets 17.4/12.2Å but partners are 3.2Å apart → too_close_together by 2.1Å
- **L35** — severity 0.88, 1 conflict(s); suspect input ~`R40` (group: push_out)
  - push-out (wants farther): G41@10.2Å(now 6.5,conf 0.67), R40@10.0Å(now 6.0,conf 0.55), F42@8.8Å(now 5.7,conf 0.52)
  - G38↔R40: targets 5.0/10.0Å but partners are 3.4Å apart → too_close_together by 1.6Å
- **Q14** — severity 0.86, 1 conflict(s); suspect input ~`N21` (group: push_out)
  - push-out (wants farther): N17@9.0Å(now 6.5,conf 0.94), N21@11.0Å(now 8.0,conf 0.55)
  - S11↔N21: targets 5.1/11.0Å but partners are 4.3Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=19 · 3-10(G)=7 · coil(C)=3

```
EGEEHHHECEEGHHHHHGGECEECEHHGHHGHHHEHEEHEGEEEHEE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=4 · sheet=32
  - Y13 ↔ N17  (helix)
  - G26 ↔ V30  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - I1 ↔ S8  (sheet)
  - I1 ↔ C10  (sheet)
  - I1 ↔ S11  (sheet)
  - E3 ↔ S8  (sheet)
  - E3 ↔ C10  (sheet)
  - E3 ↔ H23  (sheet)
  - Q4 ↔ C10  (sheet)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Q22  (sheet)
  - Q4 ↔ H23  (sheet)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ H23  (sheet)
  - S8 ↔ C25  (sheet)
  - C10 ↔ V20  (sheet)
  - C10 ↔ Q22  (sheet)
  - C10 ↔ H23  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=192 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=82 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3462 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
