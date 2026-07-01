# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1FKF\seeds\seed_0\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.655 A
- tm_score_ca_ordered: 0.8989086109773234
- heavy_atom_rmsd: 3.473 A
- sidechain_heavy_atom_rmsd: 4.419 A
- **all-atom quality (honest):** heavy 3.473 A, sidechain 4.419 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 3509
- bin_accuracy: 0.845

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=2.4608577217140852 -> 2.041656403772243 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6546969670512603
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.656786339866523  localized_anchor_rmsd: 1.6547027825081921

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D78-T84 → 64 conflicts (72%); P87-G88 → 15 conflicts (17%); P77-P92 → 4 conflicts (4%)
- explained: 83/89 conflicts by 3 root cause(s)
- metrics: hubs=19 (frac 0.181), conflicts/hub=4.7, max_incompat=5.09Å, chain_span=0.829
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D78-T84 + P87-G88 + P77-P92 — explain ~83/89 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G57** — severity 8.29, 9 conflict(s); suspect input ~`T84` (group: push_out)
  - push-out (wants farther): T84@16.0Å(now 11.7,conf 0.34), P92@15.8Å(now 12.9,conf 0.34), A83@15.1Å(now 11.3,conf 0.34)
  - Y79↔T84: targets 5.5/16.0Å but partners are 7.1Å apart → too_close_together by 3.4Å
  - Y79↔A83: targets 5.5/15.1Å but partners are 6.5Å apart → too_close_together by 3.1Å
  - A80↔T84: targets 6.4/16.0Å but partners are 6.5Å apart → too_close_together by 3.1Å
- **D78** — severity 8.14, 6 conflict(s); suspect input ~`P87` (group: push_out)
  - push-out (wants farther): G88@18.3Å(now 13.5,conf 0.37), A83@7.9Å(now 3.8,conf 0.35), P87@16.1Å(now 10.4,conf 0.35), P92@10.3Å(now 6.4,conf 0.34), T84@10.3Å(now 4.6,conf 0.34), P91@12.7Å(now 9.9,conf 0.34)
  - Y81↔P87: targets 6.8/16.1Å but partners are 4.2Å apart → too_close_together by 5.1Å
  - Y81↔G88: targets 6.8/18.3Å but partners are 6.9Å apart → too_close_together by 4.6Å
  - G82↔P87: targets 5.3/16.1Å but partners are 6.6Å apart → too_close_together by 4.2Å
- **S76** — severity 6.64, 6 conflict(s); suspect input ~`Y81` (group: push_out)
  - push-out (wants farther): G88@18.7Å(now 15.4,conf 0.37), P87@17.5Å(now 13.4,conf 0.36), T84@13.5Å(now 9.0,conf 0.34), P92@11.4Å(now 7.6,conf 0.34), P91@12.7Å(now 10.1,conf 0.34)
  - P87↔Y81: targets 17.5/9.0Å but partners are 4.2Å apart → too_close_together by 4.3Å
  - A80↔P87: targets 6.6/17.5Å but partners are 7.5Å apart → too_close_together by 3.5Å
  - G82↔T84: targets 8.2/13.5Å but partners are 1.8Å apart → too_close_together by 3.5Å
- **I75** — severity 6.03, 6 conflict(s); suspect input ~`T84` (group: push_out)
  - push-out (wants farther): P87@18.0Å(now 13.9,conf 0.36), T84@15.3Å(now 11.4,conf 0.34), P92@13.3Å(now 10.4,conf 0.34)
  - A80↔P87: targets 6.6/18.0Å but partners are 7.5Å apart → too_close_together by 3.9Å
  - P87↔Y81: targets 18.0/9.8Å but partners are 4.2Å apart → too_close_together by 3.9Å
  - T84↔G82: targets 15.3/10.5Å but partners are 1.8Å apart → too_close_together by 3.1Å
- **R56** — severity 5.70, 8 conflict(s); suspect input ~`T84` (group: push_out)
  - push-out (wants farther): P92@16.0Å(now 13.3,conf 0.34), T84@14.9Å(now 10.7,conf 0.34), A83@14.4Å(now 10.1,conf 0.34)
  - T84↔G82: targets 14.9/10.7Å but partners are 1.8Å apart → too_close_together by 2.5Å
  - Y79↔A83: targets 5.5/14.4Å but partners are 6.5Å apart → too_close_together by 2.4Å
  - Y79↔T84: targets 5.5/14.9Å but partners are 7.1Å apart → too_close_together by 2.3Å
- **V1** — severity 5.00, 5 conflict(s); suspect input ~`P92` (group: push_out)
  - push-out (wants farther): P92@17.2Å(now 13.6,conf 0.35), A83@16.7Å(now 12.9,conf 0.35)
  - P92↔P77: targets 17.2/9.6Å but partners are 4.0Å apart → too_close_together by 3.5Å
  - A83↔D78: targets 16.7/9.6Å but partners are 3.8Å apart → too_close_together by 3.3Å
  - Y79↔A83: targets 7.2/16.7Å but partners are 6.5Å apart → too_close_together by 3.1Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=37 · 3-10(G)=28 · coil(C)=10

```
CECEGHEEEHHCCEEGCHECGCEGEEEEGHHGEGHEEHHHGHEGGEEGGHEHHEHHHHHGGHHHEEGHEGECGGGGGHHEGEHEEHHEGEECHEGEGGGEEGHEC
```

## Backbone H-bond Network

- total=60 · helix(i→i+4)=11 · sheet=49
  - I6 ↔ D10  (helix)
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - Q52 ↔ R56  (helix)
  - E53 ↔ G57  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - Q64 ↔ G68  (helix)
  - Y79 ↔ A83  (helix)
  - A83 ↔ P87  (helix)
  - E4 ↔ G9  (sheet)
  - G9 ↔ F14  (sheet)
  - G9 ↔ P15  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - Y25 ↔ S37  (sheet)
  - … +40 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=56 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=447 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=257 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0138 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
