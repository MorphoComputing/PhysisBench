# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_8\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 10.957 A
- tm_score_ca_ordered: 0.22103737788202496
- heavy_atom_rmsd: 11.269 A
- sidechain_heavy_atom_rmsd: 11.453 A
- **all-atom quality (honest):** heavy 11.269 A, sidechain 11.453 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 797
- bin_accuracy: 0.876

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.957230638501825
- ga_delta_rmsd: -0.674995705021761  ga_fitness_mode: energy
- pre_local_rmsd: 10.962541328487614  localized_anchor_rmsd: 10.95719587959446

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 10 conflicts (100%)
- explained: 10/10 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.027), conflicts/hub=5.0, max_incompat=3.33Å, chain_span=0.108
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~10/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 11.65, 6 conflict(s); suspect input ~`L66` (group: push_out)
  - pull-in (wants closer): Q1@27.5Å(now 30.2,conf 1.00), K62@27.5Å(now 30.5,conf 1.00)
  - push-out (wants farther): L66@24.3Å(now 20.4,conf 0.72), R41@15.8Å(now 11.5,conf 0.55)
  - H67↔L66: targets 17.0/24.3Å but partners are 4.0Å apart → too_close_together by 3.3Å
  - V69↔L66: targets 11.0/24.3Å but partners are 10.1Å apart → too_close_together by 3.1Å
  - L68↔L66: targets 15.0/24.3Å but partners are 6.7Å apart → too_close_together by 2.6Å
- **L66** — severity 6.28, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 20.4,conf 0.72)
  - V69↔G74: targets 10.6/24.3Å but partners are 10.8Å apart → too_close_together by 3.0Å
  - G74↔R41: targets 24.3/9.9Å but partners are 11.5Å apart → too_close_together by 2.9Å
  - L70↔G74: targets 13.0/24.3Å but partners are 9.2Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=25 · 3-10(G)=12 · coil(C)=16

```
EECCCEHGECCCCCEEEHGEEHHHGHHHHHHEHHGHHGGEECEGHHEHCEEGEEHGHCEGEEHCECECCCEGGE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=8 · sheet=26
  - P18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - Q30 ↔ G34  (helix)
  - E33 ↔ P37  (helix)
  - Q1 ↔ E15  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ E17  (sheet)
  - Q1 ↔ D20  (sheet)
  - I2 ↔ E15  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - I2 ↔ D20  (sheet)
  - E15 ↔ D20  (sheet)
  - E15 ↔ K32  (sheet)
  - V16 ↔ T21  (sheet)
  - Q40 ↔ E50  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=245 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5577 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
